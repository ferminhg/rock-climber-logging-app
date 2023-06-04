import { render, screen } from '@testing-library/react'
import Home from '../app/__page'
import '@testing-library/jest-dom'
import '@testing-library/jest-dom/extend-expect'


describe('Home', () => {
    it('renders a heading', () => {
        render(<Home />)

        const heading = screen.getByRole('heading', {
            name: /Rocking with you/i,
        })

        expect(heading).toBeInTheDocument()
    })
})
